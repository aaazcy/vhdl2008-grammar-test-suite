-- =============================================================
-- Case ID: TC_DIRECTION_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Uses "downto" direction in bit_vector range and shift
--   register. Data shifts from MSB toward LSB, exercising the
--   descending direction in array slicing and loop iteration.
-- Expected Result: Compiles and runs; shifted output produced
-- Dependencies: None
-- =============================================================
entity descending_shifter is
  port (
    clk      : in  bit;
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity descending_shifter;

architecture downto_direction of descending_shifter is
  signal shift_reg : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      -- Shift right: MSB gets '0', each bit moves one position down
      shift_reg(7) <= '0';
      for i in 6 downto 0 loop
        shift_reg(i) <= shift_reg(i + 1);
      end loop;
      shift_reg <= data_in;
    end if;
  end process;
  data_out <= shift_reg;
end architecture downto_direction;
