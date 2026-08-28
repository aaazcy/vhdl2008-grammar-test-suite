-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Positive
-- Test Focus: Use of abstract_literal in physical literal context: physical literals of type time(10 ns, 1 us, 100 ps), real physical quantity(3.3 ns), physical comparison with based_literal(16#FF# ns), verify regular use of abstract_literal as the numeric part of physical quantities
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity al_time_literals is
  port (
    trigger : out bit;
    width   : out integer
  );
end entity al_time_literals;

architecture rtl of al_time_literals is
  constant C_PULSE  : time := 10 ns;
  constant C_PERIOD : time := 16#FF# ns;
  constant C_DELAY  : time := 100 ps;
  constant C_SETUP  : time := 1 us;
  constant C_HOLD   : real := 3.3;
  signal s_clk      : bit := '0';
  signal s_count    : integer := 0;
begin
  s_clk <= not s_clk after C_PULSE;
  process(s_clk)
  begin
    if s_clk'event and s_clk = '1' then
      s_count <= s_count + 1;
    end if;
  end process;
  trigger <= s_clk;
  width <= s_count;
end architecture rtl;
