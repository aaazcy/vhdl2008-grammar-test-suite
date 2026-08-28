-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: positional association in multi-dimensional array aggregate with others for inner dim
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn8_ent is port(y:out integer); end entity;
architecture bh of elem_assoc_syn8_ent is
  type t_vec2d is array(0 to 1, 0 to 1) of integer;
  signal s_m:t_vec2d:=(others=>(others=>0));
  signal s_idx:integer:=0;
begin
  process is
  begin
    s_m <= ((10,20),(30,40));
    wait for 1 ns;
    y<=s_m(0,0)+s_m(1,1);
    wait;
  end process;
end architecture bh;
