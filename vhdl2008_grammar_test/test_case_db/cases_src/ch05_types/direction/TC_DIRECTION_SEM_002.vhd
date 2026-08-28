-- =============================================================
-- Case ID: TC_DIRECTION_SEM_002
-- Related Rule ID: SEM_DIRECTIO_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: "downto" direction where bounds are reversed (0 downto
--   255). The bounds are ascending but the direction is descending.
--   This creates a valid null range and demonstrates the semantic
--   consequence of mismatched bounds vs direction.
-- Expected Result: Compiles; null range produces zero-iteration loop
-- Dependencies: None
-- =============================================================
entity direction_mismatched_bounds is
  port (
    executed : out bit
  );
end entity direction_mismatched_bounds;

architecture swapped_downto of direction_mismatched_bounds is
begin
  process
    variable hit : bit := '0';
  begin
    -- 0 downto 255 is null: left < right with downto
    for i in 0 downto 255 loop
      hit := '1';
    end loop;
    executed <= hit;
    wait;
  end process;
end architecture swapped_downto;
