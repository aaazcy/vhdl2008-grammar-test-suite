-- =============================================================
-- Case ID: TC_INTERFACE_VARIABLE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_variable_declaration ::= [ variable ] identifier_list : [ mode ] subtype_indication [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Exercises interface_variable with default value and mode out in a subprogram parameter interface.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_variable_syn3 is
  port (
    a, b : in  integer range 0 to 255;
    diff : out integer range -255 to 255
  );
end entity interface_variable_syn3;

architecture rtl of interface_variable_syn3 is
  procedure subtract_abs(
    variable x : in integer range 0 to 255 := 0;
    variable y : in integer range 0 to 255;
    variable res : out integer range -255 to 255
  ) is
  begin
    if x > y then
      res := x - y;
    else
      res := y - x;
    end if;
  end procedure;
begin
  process(a, b)
    variable v_x : integer range 0 to 255 := 0;
    variable v_y : integer range 0 to 255 := 0;
    variable v_res : integer range -255 to 255 := 0;
  begin
    v_x := a;
    v_y := b;
    subtract_abs(v_x, v_y, v_res);
    diff <= v_res;
  end process;
end architecture rtl;
