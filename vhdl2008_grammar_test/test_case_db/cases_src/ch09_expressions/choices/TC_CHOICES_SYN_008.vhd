-- =============================================================
-- Case ID: TC_CHOICES_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: Multiline pipe choices — a large number of choices joined with pipes across lines, simulating a large case table in real hardware design (such as the 16 entries of an interrupt vector table grouped with pipes)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_multiline is
  port (
    irq_num : in  integer range 0 to 15;
    vector  : out integer range 0 to 3
  );
end entity chs_multiline;

architecture irq_table of chs_multiline is
begin
  process(irq_num)
  begin
    case irq_num is
      when 0 | 1 | 2 | 3 =>
        vector <= 0;
      when 4 | 5 | 6 | 7 =>
        vector <= 1;
      when 8 | 9 |
           10 | 11 =>          -- multiline choices with pipe
        vector <= 2;
      when 12 | 13 |
           14 | 15 =>
        vector <= 3;
    end case;
  end process;
end architecture irq_table;
