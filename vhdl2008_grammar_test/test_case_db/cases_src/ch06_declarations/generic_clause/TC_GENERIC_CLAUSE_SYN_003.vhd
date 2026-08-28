-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SYN_003
-- Rule Type: Syntax
-- BNF Production: GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Test Focus: generic_clause with multiple generics of different types
--   (integer, time, boolean, bit_vector) and different default styles.
--   Tests that the generic_clause parentheses delimit a list of mixed-type
--   interface declarations, all properly terminated by ';'.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity timer_unit is
  generic (
    PERIOD_NS  : time    := 100 ns;
    WIDTH      : integer := 8;
    ACTIVE_HIGH : boolean := true;
    INIT_VAL   : bit_vector(7 downto 0) := "10101010"
  );
  port (
    clk       : in  bit;
    trigger   : in  bit;
    elapsed   : out bit_vector(WIDTH-1 downto 0);
    running   : out bit
  );
end entity timer_unit;

architecture rtl of timer_unit is
  signal s_count : integer range 0 to 2**WIDTH-1 := 0;
  signal s_active : bit;
begin
  s_active <= '1' when ACTIVE_HIGH else '0';

  process(clk)
  begin
    if clk'event and clk = '1' then
      if trigger = s_active then
        s_count <= s_count + 1;
      end if;
    end if;
  end process;

  gen_out : for i in 0 to WIDTH-1 generate
    elapsed(i) <= INIT_VAL(i) when s_count mod 2 = 0 else not INIT_VAL(i);
  end generate;

  running <= s_active;
end architecture rtl;
