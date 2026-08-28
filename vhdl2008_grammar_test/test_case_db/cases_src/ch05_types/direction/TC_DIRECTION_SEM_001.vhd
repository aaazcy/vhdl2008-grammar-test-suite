-- =============================================================
-- Case ID: TC_DIRECTION_SEM_001
-- Related Rule ID: SEM_DIRECTIO_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Semantically questionable use of "to" direction where
--   left bound exceeds right bound (32 to 0). While syntactically
--   valid, this produces a null range and is typically a design error.
--   The file compiles but produces warnings.
-- Expected Result: Compiles with range warning; loop body never executes
-- Dependencies: None
-- =============================================================
entity direction_null_range_warning is
  port (
    flag : out bit
  );
end entity direction_null_range_warning;

architecture null_to_range of direction_null_range_warning is
  signal detected : bit := '0';
begin
  process
    variable v : integer;
  begin
    -- Null range: 32 to 0, body never executes
    for i in 32 to 0 loop
      v := i;
      detected <= '1';
    end loop;
    flag <= detected;
    wait;
  end process;
end architecture null_to_range;
