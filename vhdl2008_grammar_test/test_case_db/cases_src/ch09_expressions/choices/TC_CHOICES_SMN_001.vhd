-- =============================================================
-- Case ID: TC_CHOICES_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Rule Description: The same case statement must not have the same value covered by multiple choices (including via pipe separation or different branches)
-- Error Category: duplicate_choice_coverage
-- Test Focus: SMN: duplicate value in pipe choices: when 0｜1｜1｜2, the choice value 1 appears twice in the pipe list
-- Expected Result: Triggers semantic error: duplicate choice value 1 in choices list
-- Dependencies: None
-- =============================================================
entity chs_smn_001 is
  port (
    sel : in  integer range 0 to 3;
    y   : out integer
  );
end entity chs_smn_001;

architecture dup_in_pipe of chs_smn_001 is
begin
  process(sel)
  begin
    case sel is
      when 0 | 1 | 1 | 2 =>   -- ERROR: choice value 1 appears twice
        y <= 10;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture dup_in_pipe;
