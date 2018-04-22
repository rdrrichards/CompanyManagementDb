
/*****************************************************************
**	Table Name: person
**	Procedure Name: usp_person_all_by_company_reponly
**	Author: Richard Richards
**	Created: 2015-08-02
**	Copyright: QIQO Software, (c) 2015
******************************************************************/

CREATE PROC [dbo].[usp_person_all_by_company_reponly]
	@company_key int,
	@rep_type int = 4 -- 4 account rep, 3 sales rep

AS
SET NOCOUNT ON

SELECT B.[person_key], 
	B.[person_code], 
	B.[person_first_name], 
	B.[person_mi], 
	B.[person_last_name], 
	B.[parent_person_key], 
	B.[person_dob], 
	B.[audit_add_user_id], 
	B.[audit_add_datetime], 
	B.[audit_update_user_id], 
	B.[audit_update_datetime]
FROM entity_entity A INNER JOIN person B
	ON A.secondary_entity_key = B.person_key
	AND A.secondary_entity_type_key = 3
	INNER JOIN company D
	ON A.primary_entity_key = D.company_key
	AND A.primary_entity_type_key = 1
WHERE D.company_key = @company_key
AND A.secondary_entity_type_key = @rep_type

SET NOCOUNT OFF


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_person_all_by_company_reponly] TO [businessuser]
    AS [dbo];

