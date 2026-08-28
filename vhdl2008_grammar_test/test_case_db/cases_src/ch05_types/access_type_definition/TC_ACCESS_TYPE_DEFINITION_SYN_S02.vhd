-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access to record — linked list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity acc_spc2_ent is port(r:out integer); end entity;
architecture bh of acc_spc2_ent is
  type t_node;
  type t_node_ptr is access t_node;
  type t_node is record
    val  : integer;
    nxt  : t_node_ptr;
  end record;
begin
  process
    variable head : t_node_ptr;
    variable curr : t_node_ptr;
  begin
    head := new t_node'(val=>1, nxt=>null);
    curr := new t_node'(val=>2, nxt=>head);
    r <= curr.val + curr.nxt.val;
    wait;
  end process;
end architecture bh;
