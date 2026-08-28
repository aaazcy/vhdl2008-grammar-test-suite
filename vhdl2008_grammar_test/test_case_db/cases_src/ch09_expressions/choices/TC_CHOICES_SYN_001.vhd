-- =============================================================
-- Case ID: TC_CHOICES_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: Minimal form: a single choice with no pipe separator — a single simple_expression 0 forms the choices, verifying the minimal form of choices (zero repetitions of { ｜ choice })
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_minimal is
  port (
    sel : in  integer range 0 to 1;
    y   : out integer
  );
end entity chs_minimal;

architecture single_choice of chs_minimal is
begin
  with sel select
    y <= 10 when 0,     -- single choice: no pipe
         0  when others;
end architecture single_choice;
