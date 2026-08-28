-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: adding_operator used in function return value expressions — a pure function computes the addition/subtraction result of two natural inputs and returns natural, verifying the correct syntax of + and - in the function body simple_expression chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_func_addsub is
  port (
    x_i : in  natural range 0 to 100;
    y_i : in  natural range 0 to 100;
    mode_i : in  bit;
    z_o : out natural range 0 to 200
  );
end entity ent_func_addsub;

architecture rtl of ent_func_addsub is
  function calc_result(a, b : natural; op : bit) return natural is
  begin
    if op = '0' then
      return a + b;
    else
      if a > b then
        return a - b;
      else
        return 0;
      end if;
    end if;
  end function calc_result;
begin
  z_o <= calc_result(x_i, y_i, mode_i);
end architecture rtl;
