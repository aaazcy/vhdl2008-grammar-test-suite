-- =============================================================
-- Case ID: TC_FORCE_MODE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Rule Description: Force out on output port is semantically valid -- out ports can be forced out
-- Case Type: Positive
-- Test Focus: Valid force out on output port bit_vector -- tests that `force out` correctly matches port direction semantics
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fmode_sem_001 is
  port (
    o_data : out bit_vector(7 downto 0)
  );
end entity fmode_sem_001;

architecture test of fmode_sem_001 is
begin
  process is
  begin
    o_data <= force out "10101010";
    wait for 10 ns;
    o_data <= release out;
    wait;
  end process;
end architecture test;
