-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S11
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: unbounded 2D array with mixed index types (natural, positive) — exercises unbounded_array_definition with two box placeholders and different discrete type marks
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_unbounded_ent is port(r:out integer); end entity;
architecture bh of arr_unbounded_ent is
  type t_grid is array(natural range <>, positive range <>) of real;
  signal s_g : t_grid(0 to 3, 1 to 4) := (others => (others => 0.0));
begin
  process
  begin
    s_g(0,1) <= 3.14;
    r <= integer(s_g(0,1));
    wait;
  end process;
end architecture bh;
