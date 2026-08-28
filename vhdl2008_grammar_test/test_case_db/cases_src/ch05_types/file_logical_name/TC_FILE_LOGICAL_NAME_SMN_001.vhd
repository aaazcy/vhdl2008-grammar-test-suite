-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Negative
-- Test Focus: Static model negative -- file_logical_name as integer expression (type mismatch)
-- Expected Result: Triggers type error
-- Dependencies: None
-- =============================================================
entity fln_smn_int is port(dout:out integer); end entity;
architecture rtl of fln_smn_int is
  type t_intfile is file of integer;
  constant C_BAD : integer := 12345;
  file f : t_intfile open READ_MODE is C_BAD;  -- ERROR: integer not string_expression
begin
  dout<=0;
end architecture rtl;
