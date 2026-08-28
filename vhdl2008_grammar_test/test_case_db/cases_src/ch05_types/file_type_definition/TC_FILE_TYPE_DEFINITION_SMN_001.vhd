-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: Static model negative — file type definition 'file of;' ends directly after 'of' without any type_mark, so the file type has no element type
-- Expected Result: Triggers syntax error: name expected here, found ';'
-- Dependencies: None
-- =============================================================
entity ftd_ent is end entity;
architecture rtl of ftd_ent is
  type t_badfile is file of;
begin
end architecture;
