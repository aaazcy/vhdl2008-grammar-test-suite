-- =============================================================
-- Case ID: TC_INTEGER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTEGER
-- IEEE Section: 15.5.3
-- BNF Text: integer ::= digit { [ underline ] digit }
-- Test Focus: Simple integer literal used as a constant value and range bound in a counter design
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity integer_syn_s01 is
  port (
    clk      : in  bit;
    count_out : out integer range 0 to 255
  );
end entity integer_syn_s01;

architecture rtl of integer_syn_s01 is
  -- Simple integer literals used as range bounds
  signal counter : integer range 0 to 255 := 0;
  constant MAX_COUNT : integer := 255;
  constant MIN_COUNT : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if counter < MAX_COUNT then
        counter <= counter + 1;
      else
        counter <= MIN_COUNT;
      end if;
    end if;
  end process;
  count_out <= counter;
end architecture rtl;
