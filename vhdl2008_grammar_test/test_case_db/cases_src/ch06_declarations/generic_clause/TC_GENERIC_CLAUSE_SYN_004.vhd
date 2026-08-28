-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Case Type: Positive
-- Test Focus: Exercises generic_clause with multiple generics of different types (integer, time, boolean, string) for a timer module.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_clause_timer is
  generic (
    TIMEOUT_CYCLES : integer := 1000;
    CLK_PERIOD_NS  : integer := 10;
    ENABLE_AT_START : boolean := true;
    TIMER_ID       : string := "TMR"
  );
  port (
    clk      : in  bit;
    rst_n    : in  bit;
    start    : in  bit;
    timeout  : out bit;
    count    : out integer range 0 to TIMEOUT_CYCLES
  );
end entity generic_clause_timer;

architecture rtl of generic_clause_timer is
  signal s_count : integer range 0 to TIMEOUT_CYCLES := 0;
  signal s_active : boolean := ENABLE_AT_START;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_count <= 0;
      s_active <= ENABLE_AT_START;
      timeout <= '0';
    elsif clk'event and clk = '1' then
      if start = '1' then
        s_active <= true;
        s_count <= 0;
      elsif s_active then
        if s_count = TIMEOUT_CYCLES then
          timeout <= '1';
          s_active <= false;
        else
          s_count <= s_count + 1;
        end if;
      end if;
    end if;
  end process;
  count <= s_count;
end architecture rtl;
