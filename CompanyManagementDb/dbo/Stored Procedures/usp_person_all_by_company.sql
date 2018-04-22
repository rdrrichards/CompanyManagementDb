
/*****************************************************************
**	Table Name: person
**	Procedure Name: usp_person_all_by_company 1
**	Author: Richard Richards
**	Created: 06/23/2015
**	Copyright: QIQO Software, (c) 2015
******************************************************************/

CREATE PROC [dbo].[usp_person_all_by_company]
@company_key int

AS
SET NOCOUNT ON

SELECT --DISTINCT 
	B.[person_key], 
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


SET NOCOUNT OFF




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_person_all_by_company] TO [businessuser]
    AS [dbo];

