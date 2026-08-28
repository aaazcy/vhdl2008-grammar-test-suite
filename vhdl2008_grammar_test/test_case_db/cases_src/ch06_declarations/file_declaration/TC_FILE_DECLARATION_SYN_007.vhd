-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::= file identifier_list : subtype_indication [ file_open_information ] ;
-- Case Type: Positive
-- Test Focus: Exercises file_declaration syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_declaration_syn7 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(10 downto 0);
    accum : out integer range 0 to 32
  );
end entity file_declaration_syn7;

architecture rtl of file_declaration_syn7 is
  signal s_accum : integer range 0 to 32 := 0;
  signal s_data  : bit_vector(10 downto 0) := (others => '0');
begin
  process(clk)
    variable v_temp : integer range 0 to 32 := 0;
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      v_temp := 0;
      for i in 0 to 10 loop
        if s_data(i) = '1' then
          v_temp := v_temp + 1;
        end if;
      end loop;
      s_accum <= (s_accum + v_temp) mod 33;
    end if;
  end process;
  accum <= s_accum;
end architecture rtl;
