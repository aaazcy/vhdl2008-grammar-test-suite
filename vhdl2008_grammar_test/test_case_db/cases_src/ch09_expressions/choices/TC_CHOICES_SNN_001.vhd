-- =============================================================
-- Case ID: TC_CHOICES_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SNN: leading pipe: choices start with a pipe ｜ 1 ｜ 2; there must be no pipe separator before the first choice
-- Expected Result: Triggers syntax error: leading pipe '|' before first choice
-- Dependencies: None
-- =============================================================
entity chs_snn_001 is
  port (
    sel : in  integer range 0 to 3;
    y   : out integer
  );
end entity chs_snn_001;

architecture leading_pipe of chs_snn_001 is
begin
  process(sel)
  begin
    case sel is
      when | 1 | 2 =>   -- ERROR: leading pipe before first choice
        y <= 10;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture leading_pipe;
