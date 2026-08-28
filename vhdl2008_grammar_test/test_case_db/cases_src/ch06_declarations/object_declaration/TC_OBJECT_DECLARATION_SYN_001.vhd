-- =============================================================
-- Case ID: TC_OBJECT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2
-- Production: object_declaration ::= constant_declaration | signal_declaration | variable_declaration | file_declaration
-- Case Type: Positive
-- Test Focus: Exercises object_declaration through all four alternatives: constant, signal, variable, and file declarations in one unit.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity object_decl_syn1 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(7 downto 0);
    sum   : out integer range 0 to 65535
  );
end entity object_decl_syn1;

architecture rtl of object_decl_syn1 is
  -- constant_declaration
  constant C_SCALE_FACTOR : integer := 2;
  -- signal_declaration
  signal s_accum : integer range 0 to 65535 := 0;
  signal s_data_reg : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk)
    -- variable_declaration
    variable v_temp : integer range 0 to 65535 := 0;
    variable v_count : integer range 0 to 255 := 0;
  begin
    if clk'event and clk = '1' then
      s_data_reg <= data;
      v_temp := 0;
      for i in 0 to 7 loop
        if s_data_reg(i) = '1' then
          v_temp := v_temp + (2**i) * C_SCALE_FACTOR;
        end if;
      end loop;
      s_accum <= s_accum + v_temp;
      v_count := v_count + 1;
    end if;
    sum <= s_accum;
  end process;
end architecture rtl;
