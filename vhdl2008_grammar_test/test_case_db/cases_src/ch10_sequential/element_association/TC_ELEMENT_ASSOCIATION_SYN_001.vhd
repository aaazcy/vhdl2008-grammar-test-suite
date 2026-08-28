-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: named association (choices => expression) in array aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn1_ent is port(y:out integer); end entity;
architecture bh of elem_assoc_syn1_ent is
  type t_arr is array(0 to 3) of integer;
  signal s_arr:t_arr:=(0=>10, 1=>20, 2=>30, 3=>40);
  signal s_val:integer:=0;
begin
  process is
  begin
    s_val <= s_arr(0) + s_arr(3);
    y <= s_val;
    wait;
  end process;
end architecture bh;
