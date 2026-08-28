-- =============================================================
-- Case ID: TC_LETTER_SYN_002
-- Rule Type: Syntax
-- BNF Production: LETTER
-- IEEE Section: 15.3
-- BNF Text: letter ::= upper_case_letter | lower_case_letter
-- Test Focus: Lower-case letters as the starting character of identifiers in a mixed-case design
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity letter_syn_002 is
  port (
    clk   : in  bit;
    rst_n : in  bit;
    q_out : out bit_vector(3 downto 0)
  );
end entity letter_syn_002;

architecture rtl of letter_syn_002 is
  -- Lower-case letters as first character of identifiers
  signal counter_reg : bit_vector(3 downto 0) := "0000";
  signal next_state  : bit_vector(3 downto 0);
begin
  next_state <= counter_reg xor "0001";
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      counter_reg <= "0000";
    elsif clk'event and clk = '1' then
      counter_reg <= next_state;
    end if;
  end process;
  q_out <= counter_reg;
end architecture rtl;
