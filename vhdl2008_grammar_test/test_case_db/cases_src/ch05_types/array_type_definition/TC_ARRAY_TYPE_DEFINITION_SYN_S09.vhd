-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S09
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: constrained array with enumeration index type having 4+ literals — exercises discrete_range using an enum type as index in constrained_array_definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_enum_ent is port(r:out integer); end entity;
architecture bh of arr_enum_ent is
  type t_state is (IDLE, READ, WRITE, DONE, ERROR);
  type t_state_map is array(t_state range IDLE to DONE) of bit;
  signal s_sm : t_state_map := (others => '0');
begin
  process
  begin
    s_sm(READ) <= '1';
    s_sm(WRITE) <= '1';
    r <= 1 when s_sm(READ) = '1' else 0;
    wait;
  end process;
end architecture bh;
