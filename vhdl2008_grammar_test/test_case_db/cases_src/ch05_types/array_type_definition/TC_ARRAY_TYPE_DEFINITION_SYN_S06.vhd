-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S06
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: unbounded array with natural range and array attribute reference — exercises unbounded_array_definition with type_mark index and 'range/'length attribute usage on the instantiated signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_unbounded_ent is port(r:out integer); end entity;
architecture bh of arr_unbounded_ent is
  type t_vec is array(natural range <>) of integer;
  signal s_v : t_vec(0 to 15) := (others => 0);
begin
  process
  begin
    for i in s_v'range loop
      s_v(i) <= i;
    end loop;
    r <= s_v'length;
    wait;
  end process;
end architecture bh;
