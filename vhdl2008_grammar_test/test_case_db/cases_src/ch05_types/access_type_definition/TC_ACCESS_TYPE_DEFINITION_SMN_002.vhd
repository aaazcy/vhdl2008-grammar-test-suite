-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Negative
-- Test Focus: static model negative -- access to incomplete type used before completion
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity atd_smn_incomplete is port(dout:out integer); end entity;
architecture rtl of atd_smn_incomplete is
  type t_node; type t_node_ptr is access t_node;
  shared variable sv:t_node_ptr;
begin process begin sv:=new t_node;  -- ERROR: t_node incomplete, cannot allocate
end process; end architecture;