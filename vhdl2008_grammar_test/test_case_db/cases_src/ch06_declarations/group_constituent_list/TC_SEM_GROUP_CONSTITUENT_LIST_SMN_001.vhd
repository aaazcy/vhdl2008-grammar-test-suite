-- =============================================================
-- Case ID: TC_SEM_GROUP_CONSTITUENT_LIST_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Negative
-- Test Focus: group_constituent_list: more constituents in list than entity classes in template
-- Expected Result: Triggers semantic error (constituent count mismatch)
-- Dependencies: None
-- =============================================================
entity gcl_count_mismatch_sem is
  port (
    flag : out bit
  );
end entity gcl_count_mismatch_sem;

architecture semerr of gcl_count_mismatch_sem is
  -- Template defines only 2 entries but group provides 3 constituents
  group dual_entry is (signal <>, signal <>);
  signal s_x : bit := '0';
  signal s_y : bit := '0';
  signal s_z : bit := '0';
  -- ERROR: 3 constituents supplied but template expects 2
  group broken : dual_entry (s_x, s_y, s_z);
begin
  flag <= '0';
end architecture semerr;
