-- =============================================================
-- Case ID: TC_SEM_ARR_002_SEM_003
-- Rule Type: Semantics
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Positive
-- Test Focus: unbounded array type used as function parameter — verifies that an unconstrained array type can be passed through a subprogram interface
-- Expected Result: Compiles and synthesizes successfully
-- Dependencies: None
-- =============================================================
entity arr_unbounded_ent is port(r:out integer); end entity;
architecture bh of arr_unbounded_ent is
  type t_vec is array(integer range <>) of integer;
  signal s_v : t_vec(0 to 3) := (1, 2, 3, 4);

  function sum_elements(a : t_vec) return integer is
    variable total : integer := 0;
  begin
    for i in a'range loop
      total := total + a(i);
    end loop;
    return total;
  end function;
begin
  process
  begin
    r <= sum_elements(s_v);
    wait;
  end process;
end architecture bh;
