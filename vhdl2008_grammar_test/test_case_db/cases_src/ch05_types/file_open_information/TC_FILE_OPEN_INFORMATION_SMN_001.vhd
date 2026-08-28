-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Negative
-- Test Focus: Static model negative — the file_open_kind_expression after 'open' is the integer literal 42, but file_open_kind_expression must be of type FILE_OPEN_KIND, so the open information is ill-typed
-- Expected Result: Triggers semantic error: can't match integer literal with type file_open_kind
-- Dependencies: None
-- =============================================================
entity foi_ent is
  port ( dout : out integer );
end entity foi_ent;
architecture rtl of foi_ent is
  type t_intfile is file of integer;
  file f_bad : t_intfile open 42 is "ro.dat";
begin
  dout <= 0;
end architecture rtl;
