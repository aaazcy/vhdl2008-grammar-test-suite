-- =============================================================
-- Case ID: TC_CHOICES_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Rule Description: All pipe-separated choices must cover distinct values without overlap; the pipe only combines multiple distinct choices, and duplicate values are not allowed
-- Test Focus: All pipe choices are non-overlapping discrete values: each value in 0｜1｜2｜3｜4｜5｜6｜7 is unique and others covers the rest, verifying that the compiler accepts fully partitioned coverage of choices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_sem_001 is
  port (
    code   : in  integer range 0 to 9;
    parity : out bit
  );
end entity chs_sem_001;

architecture non_overlap of chs_sem_001 is
begin
  process(code)
  begin
    case code is
      when 0 | 2 | 4 | 6 | 8 =>   -- pipe-separated even numbers, all distinct
        parity <= '0';
      when 1 | 3 | 5 | 7 | 9 =>   -- pipe-separated odd numbers, all distinct
        parity <= '1';
    end case;
  end process;
end architecture non_overlap;
