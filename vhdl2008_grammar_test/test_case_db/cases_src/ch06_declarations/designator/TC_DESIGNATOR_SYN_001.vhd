-- =============================================================
-- Case ID: TC_DESIGNATOR_SYN_001
-- Rule Type: Syntax
-- BNF Production: DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Test Focus: Identifier form of designator used in three
--   subprogram declarations (function + two procedures) with
--   distinct parameter and return profiles — exercises
--   designator as function name and procedure name
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity designator_syn_001 is
  port (
    a_in    : in  integer range 0 to 255;
    b_in    : in  integer range 0 to 255;
    sel_in  : in  bit;
    max_out : out integer range 0 to 255;
    min_out : out integer range 0 to 255
  );
end entity designator_syn_001;

architecture rtl of designator_syn_001 is
  -- Function using identifier designator
  function max_of_two(x, y : integer) return integer is
  begin
    if x > y then return x; else return y; end if;
  end function;

  -- Function using identifier designator
  function min_of_two(x, y : integer) return integer is
  begin
    if x < y then return x; else return y; end if;
  end function;

  -- Procedure using identifier designator
  procedure report_values(a, b : integer) is
  begin
    assert false
      report "a=" & integer'image(a) & " b=" & integer'image(b)
      severity note;
  end procedure;

  signal s_a, s_b : integer range 0 to 255 := 0;
begin
  s_a <= a_in;
  s_b <= b_in;

  -- Call function with identifier designator
  max_out <= max_of_two(s_a, s_b);
  min_out <= min_of_two(s_a, s_b);

  -- Call procedure with identifier designator
  report_values(s_a, s_b);
end architecture rtl;
