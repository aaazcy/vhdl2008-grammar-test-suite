-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: static model negative -- type used before declaration (forward reference error)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity td_smn_forward is port(dout:out integer); end entity;
architecture rtl of td_smn_forward is
  signal s:t_node;  -- ERROR: t_node not yet declared
  type t_node is record val:integer; nxt:integer; end record;
begin dout<=s.val; end architecture;