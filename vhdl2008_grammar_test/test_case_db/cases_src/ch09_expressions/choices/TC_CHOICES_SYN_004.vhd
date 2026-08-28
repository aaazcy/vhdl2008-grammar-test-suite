-- =============================================================
-- Case ID: TC_CHOICES_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: Two choices joined by a pipe: 0 ｜ 1 — the { ｜ choice } repetition, used to merge two adjacent case branches into a single statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_two_pipe is
  port (
    level : in  integer range 0 to 3;
    gain  : out integer
  );
end entity chs_two_pipe;

architecture dual_choice of chs_two_pipe is
begin
  process(level)
  begin
    case level is
      when 0 | 1 =>     -- choices: two simple_expressions with pipe
        gain <= 1;
      when 2 | 3 =>     -- choices: two simple_expressions with pipe
        gain <= 10;
    end case;
  end process;
end architecture dual_choice;
