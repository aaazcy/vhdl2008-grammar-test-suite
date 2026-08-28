-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Case with physical type expression: expression is a custom physical type t_freq (Hz/kHz/MHz units), choices use physical literals (0 Hz / 1 kHz / 1 MHz / others), verifying the case expression accepts a physical type - boundary extension of discrete types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_phys_ent is
  port(freq_sel:in integer range 0 to 2; y:out integer);
end entity;
architecture bh of case_phys_ent is
  type t_freq is range 0 to 1000000000 units Hz; kHz=1000 Hz; MHz=1000 kHz; end units;
  signal s_freq:t_freq:=0 Hz;
begin
  process(freq_sel)
  begin
    case freq_sel is
      when 0 => s_freq<=0 Hz;   y<=0;
      when 1 => s_freq<=1 kHz;  y<=1000;
      when 2 => s_freq<=1 MHz;  y<=1000000;
    end case;
  end process;
end architecture bh;
