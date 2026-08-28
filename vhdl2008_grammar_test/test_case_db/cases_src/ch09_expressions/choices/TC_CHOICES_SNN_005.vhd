-- =============================================================
-- Case ID: TC_CHOICES_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Negative
-- Test Focus: SNN: trailing pipe: choices end with a pipe 1 ｜ 2 ｜; there must be no pipe separator after the last choice
-- Expected Result: Triggers syntax error: trailing pipe after last choice
-- Dependencies: None
-- =============================================================
entity chs_snn_005 is
  port (
    sel : in  integer range 0 to 3;
    y   : out integer
  );
end entity chs_snn_005;

architecture trailing_pipe of chs_snn_005 is
begin
  process(sel)
  begin
    case sel is
      when 1 | 2 | =>   -- ERROR: trailing pipe with no following choice
        y <= 10;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture trailing_pipe;
