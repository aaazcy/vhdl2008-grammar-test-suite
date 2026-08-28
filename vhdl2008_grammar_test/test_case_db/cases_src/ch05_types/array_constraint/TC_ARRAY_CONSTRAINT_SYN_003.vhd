-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive
-- Test Focus: (open) form of array_constraint — exercises the (open) branch for unconstrained formal array in interface list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity array_ctr_open_constraint is
  port(
    input_val  : in  integer;
    output_val : out integer
  );
end entity;

architecture open_array_usage of array_ctr_open_constraint is
  type t_dyn_arr is array (natural range <>) of integer;

  function sum_array(arr : t_dyn_arr) return integer is
    variable total : integer := 0;
  begin
    for i in arr'range loop
      total := total + arr(i);
    end loop;
    return total;
  end function;

  signal data_arr : t_dyn_arr(0 to 7) := (1,2,3,4,5,6,7,8);
  signal result   : integer := 0;
begin
  result <= sum_array(data_arr) + input_val;
  output_val <= result;
end architecture;
