-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S10
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: constrained array with positive range — exercises constrained_array_definition using the predefined integer subtype positive as the index type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_constrained_ent is port(r:out integer); end entity;
architecture bh of arr_constrained_ent is
  type t_buf is array(positive range 1 to 16) of bit;
  signal s_b : t_buf := (others => '0');
begin
  process
  begin
    s_b(1) <= '1';
    s_b(16) <= '0';
    r <= 1 when s_b(1) = '1' else 0;
    wait;
  end process;
end architecture bh;
