-- =============================================================
-- Case ID: TC_MODE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Positive
-- Test Focus: Demonstrates buffer mode on a port that is read internally by a counter with parallel load capability.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mode_buffer_counter is
  port (
    clk       : in  bit;
    load_en   : in  bit;
    load_val  : in  bit_vector(3 downto 0);
    count_out : buffer bit_vector(3 downto 0)
  );
end entity mode_buffer_counter;

architecture rtl of mode_buffer_counter is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if load_en = '1' then
        count_out <= load_val;
      else
        count_out <= count_out(2 downto 0) & not count_out(3);
      end if;
    end if;
  end process;
end architecture rtl;
