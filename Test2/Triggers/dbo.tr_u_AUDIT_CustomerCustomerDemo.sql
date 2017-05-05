SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_CustomerCustomerDemo]
ON [dbo].[CustomerCustomerDemo]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[CustomerCustomerDemo]
-- Author:       ApexSQL Software
-- Date:		 9/19/2016 8:17:02 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE			varchar(50),
		@AUDIT_LOG_TRANSACTION_ID	Int,
		@PRIM_KEY			nvarchar(4000),
		@Inserted	    		bit,
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[CustomerCustomerDemo]'
	Select @ROWS_COUNT=count(*) from inserted
	SET @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

	INSERT
	INTO [NORTHWND].dbo.AUDIT_LOG_TRANSACTIONS
	(
		TABLE_NAME,
		TABLE_SCHEMA,
		AUDIT_ACTION_ID,
		HOST_NAME,
		APP_NAME,
		MODIFIED_BY,
		MODIFIED_DATE,
		AFFECTED_ROWS,
		[DATABASE]
	)
	values(
		'CustomerCustomerDemo',
		'dbo',
		1,	--	ACTION ID For UPDATE
		CASE 
		  WHEN LEN(HOST_NAME()) < 1 THEN ' '
		  ELSE HOST_NAME()
		END,
		CASE 
		  WHEN LEN(APP_NAME()) < 1 THEN ' '
		  ELSE APP_NAME()
		END,
		SUSER_SNAME(),
		GETDATE(),
		@ROWS_COUNT,
		'NORTHWND'
	)

	
	Set @AUDIT_LOG_TRANSACTION_ID = SCOPE_IDENTITY()
	

	SET @Inserted = 0
	
	If UPDATE([CustomerID])
	BEGIN
    
		INSERT
		INTO [NORTHWND].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerID]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0),'''' ,'''''')+'''', '[CustomerID] Is Null')+' AND '+IsNull('[CustomerTypeID]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[CustomerTypeID], NEW.[CustomerTypeID]), 0),'''' ,'''''')+'''', '[CustomerTypeID] Is Null')),
		    'CustomerID',
			CONVERT(nvarchar(4000), OLD.[CustomerID], 0),
			CONVERT(nvarchar(4000), NEW.[CustomerID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[CustomerTypeID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0) or (NEW.[CustomerTypeID] Is Null and OLD.[CustomerTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[CustomerID] <>
					OLD.[CustomerID]
				) Or
			
				(
					NEW.[CustomerID] Is Null And
					OLD.[CustomerID] Is Not Null
				) Or
				(
					NEW.[CustomerID] Is Not Null And
					OLD.[CustomerID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CustomerTypeID])
	BEGIN
    
		INSERT
		INTO [NORTHWND].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1, KEY2
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerID]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[CustomerID], NEW.[CustomerID]), 0),'''' ,'''''')+'''', '[CustomerID] Is Null')+' AND '+IsNull('[CustomerTypeID]=N'''+replace(CONVERT(nvarchar(4000), IsNull(OLD.[CustomerTypeID], NEW.[CustomerTypeID]), 0),'''' ,'''''')+'''', '[CustomerTypeID] Is Null')),
		    'CustomerTypeID',
			CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0),
			CONVERT(nvarchar(4000), NEW.[CustomerTypeID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerID], 0))), IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerTypeID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[CustomerID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerID], 0) or (NEW.[CustomerID] Is Null and OLD.[CustomerID] Is Null)) AND (CONVERT(nvarchar(4000), NEW.[CustomerTypeID], 0)=CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0) or (NEW.[CustomerTypeID] Is Null and OLD.[CustomerTypeID] Is Null))
			WHERE (
			
			
				(
					NEW.[CustomerTypeID] <>
					OLD.[CustomerTypeID]
				) Or
			
				(
					NEW.[CustomerTypeID] Is Null And
					OLD.[CustomerTypeID] Is Not Null
				) Or
				(
					NEW.[CustomerTypeID] Is Not Null And
					OLD.[CustomerTypeID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	-- Watch
	
	-- Lookup
	
	IF @Inserted = 0
	BEGIN
		DELETE FROM [NORTHWND].dbo.AUDIT_LOG_TRANSACTIONS WHERE AUDIT_LOG_TRANSACTION_ID = @AUDIT_LOG_TRANSACTION_ID
	END

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  
End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_CustomerCustomerDemo]', @order='Last', @stmttype='UPDATE'
GO
