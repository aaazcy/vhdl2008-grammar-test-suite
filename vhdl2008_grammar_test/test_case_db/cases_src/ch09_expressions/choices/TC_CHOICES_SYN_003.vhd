-- =============================================================
-- Case ID: TC_CHOICES_SYN_003
-- Rule Type: Syntax
-- BNF Production: choices
-- IEEE Section: 9.3.3.1
-- BNF Text: choices ::= choice { | choice }
-- Test Focus: choices combining 'others' with explicit pipe-separated choices in a selected signal assignment
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_choices_syn_003 is
  port (
    bus_cmd  : in  bit_vector(1 downto 0);
    dev_sel  : in  bit_vector(2 downto 0);
    bus_gnt  : out bit_vector(3 downto 0)
  );
end entity tc_choices_syn_003;

architecture arbiter of tc_choices_syn_003 is
begin
  with bus_cmd select
    bus_gnt <= "0001" when "00",
               "0010" when "01",
               "0100" | "1000" when "10",
               "0000" when others;
end architecture arbiter;
