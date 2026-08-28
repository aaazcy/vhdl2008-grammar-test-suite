-- =============================================================
-- Case ID: TC_CHOICE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Rule Description: The direction (to/downto) of a discrete_range choice must match the index direction of the case expression, or at least cover the legal value range; together the choices must cover all possible values of the case expression
-- Test Focus: discrete_range to and downto combined with others in the same case cover all values: 0 to 3, 7 downto 4, others cover all integers 0..7
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_sem_001 is
  port (
    addr   : in  integer range 0 to 7;
    bank   : out integer range 0 to 2
  );
end entity ch_sem_001;

architecture full_coverage of ch_sem_001 is
begin
  process(addr)
  begin
    case addr is
      when 0 to 3 =>       -- discrete_range (to): covers 0,1,2,3
        bank <= 0;
      when 7 downto 4 =>   -- discrete_range (downto): covers 4,5,6,7
        bank <= 1;
      when others =>       -- others: redundant but valid, covers any remaining
        bank <= 2;
    end case;
  end process;
end architecture full_coverage;
