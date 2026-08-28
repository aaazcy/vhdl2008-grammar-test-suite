-- =============================================================
-- Case ID: TC_FORCE_MODE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Rule Description: Force out on a constant is invalid -- constants are not forceable targets
-- Case Type: Negative
-- Test Focus: Attempting `force out` on a constant declaration -- constants are immutable and cannot be forced
-- Expected Result: Triggers semantic error: cannot force on constant
-- Dependencies: None
-- =============================================================
entity fmode_smn_002 is
end entity fmode_smn_002;

architecture test of fmode_smn_002 is
  constant c_val : integer := 0;
begin
  process is
  begin
    c_val <= force out 10;  -- ERROR: cannot force on constant
    wait;
  end process;
end architecture test;
