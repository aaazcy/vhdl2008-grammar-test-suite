-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Negative
-- Test Focus: Static model negative — the file declaration ends after 'is' without any file_logical_name expression, so the open information is incomplete and cannot be parsed
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity foi20_ent is
  port ( dout : out integer );
end entity foi20_ent;
architecture rtl of foi20_ent is
  type t_intfile is file of integer;
  file f1 : t_intfile open READ_MODE is;
begin
  dout <= 0;
end architecture rtl;
