-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BASIC_IDENTIFIER
-- IEEE Section: 15.4.2
-- BNF Text: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Test Focus: Simple basic_identifier used as entity name and signal names in a register design
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity basic_identifier_syn_s01 is
  port (
    clk     : in  bit;
    data_in : in  bit_vector(7 downto 0);
    data_out: out bit_vector(7 downto 0)
  );
end entity basic_identifier_syn_s01;

architecture rtl of basic_identifier_syn_s01 is
  -- All names are basic_identifiers (start with letter, contain letters/digits)
  signal pipeline_reg : bit_vector(7 downto 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      pipeline_reg <= data_in;
    end if;
  end process;
  data_out <= pipeline_reg;
end architecture rtl;
