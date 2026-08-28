-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: attribute_specification on procedure entity_class — exercises the 'procedure' and 'label' entity_class entries, which are less commonly tested compared to signal/entity/component
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity as_proc_ent is
  port(a,b : in integer; y : out integer);
end entity;

architecture bh of as_proc_ent is
  attribute call_cost : integer;
  procedure p_swap(x,y : inout integer) is
    variable tmp : integer;
  begin tmp := x; x := y; y := tmp; end procedure;
  attribute call_cost of p_swap[integer, integer] : procedure is 3;
  attribute arch_label : string;
  attribute arch_label of swap_proc : label is "swap_processor_arch";
  signal s_a, s_b : integer := 0;
begin
  s_a <= a; s_b <= b;
  swap_proc : process is
    variable v1, v2 : integer;
  begin
    v1 := s_b; v2 := s_a;
    p_swap(v1, v2);
    s_b <= v1; s_a <= v2;
    wait;
  end process;
  y <= s_a + s_b;
end architecture bh;
