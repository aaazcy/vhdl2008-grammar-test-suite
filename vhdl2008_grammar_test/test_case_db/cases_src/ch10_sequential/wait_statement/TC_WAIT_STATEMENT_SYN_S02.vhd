-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: With label + on+until+for: `pkt_wait: wait on rx_clk until rx_valid='1' for 500 ns;` — production-grade usage with a label and all three clauses present
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_labeled_full_ent is
  port (
    rx_clk   : in  bit;
    rx_valid : in  bit;
    rx_data  : out bit_vector(3 downto 0)
  );
end entity wait_labeled_full_ent;

architecture uart of wait_labeled_full_ent is
  signal s_shift : bit_vector(3 downto 0) := "0000";
begin
  process is
    variable v_bit : integer range 0 to 4 := 0;
  begin
    v_bit := 0;
    while v_bit < 4 loop
      pkt_wait: wait on rx_clk until rx_valid = '1' for 500 ns;
      s_shift <= s_shift(2 downto 0) & '1';
      v_bit := v_bit + 1;
    end loop;
    rx_data <= s_shift;
    wait;
  end process;
end architecture uart;
