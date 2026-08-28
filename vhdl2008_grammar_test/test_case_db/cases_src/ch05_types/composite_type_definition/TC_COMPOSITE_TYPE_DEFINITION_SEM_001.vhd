-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: Semantic: array_type_definition used for a 32-entry
--            scoreboard in an out-of-order processor pipeline.
--            Each entry tracks instruction completion status.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pipeline_scoreboard is
  port (
    clk      : in  bit;
    issue_id : in  integer range 0 to 31;
    complete : in  bit;
    ready    : out bit
  );
end entity pipeline_scoreboard;

architecture rtl of pipeline_scoreboard is
  type score_entry is record
    issued    : bit;
    finished  : bit;
    tag       : integer range 0 to 63;
  end record;
  type scoreboard is array (0 to 31) of score_entry;
  signal sb : scoreboard := (others =>
    (issued => '0', finished => '0', tag => 0));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if complete = '1' then
        sb(issue_id).finished <= '1';
      end if;
      ready <= sb(issue_id).finished;
    end if;
  end process;
end architecture rtl;
