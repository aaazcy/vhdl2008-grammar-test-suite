-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Negative
-- Test Focus: static model negative — the file logical name is the integer literal 42, but a file_logical_name must be a string expression naming the physical file
-- Expected Result: Triggers semantic error: can't match integer literal with type array type "string"
-- Dependencies: None
-- =============================================================
entity lnl_ent is port(dout:out integer); end entity;
architecture rtl of lnl_ent is
  type t_intfile is file of integer;
  file f : t_intfile open READ_MODE is 42;
begin
  dout<=0;
end architecture;
