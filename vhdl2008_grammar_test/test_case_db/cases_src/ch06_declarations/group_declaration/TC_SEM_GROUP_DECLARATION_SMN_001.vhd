-- =============================================================
-- Case ID: TC_SEM_GROUP_DECLARATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Negative
-- Test Focus: group_declaration: template name references a group template with incompatible entity classes
-- Expected Result: Triggers semantic error (entity class mismatch)
-- Dependencies: None
-- =============================================================
entity gd_class_mismatch_sem is
  port (
    flag : out bit
  );
end entity gd_class_mismatch_sem;

architecture semerr of gd_class_mismatch_sem is
  -- Template expects constant entries but signal is provided
  group const_pair is (constant <>, constant <>);
  signal s_mode : integer := 0;
  constant C_THRESH : integer := 100;
  -- ERROR: s_mode is a signal but template expects constant
  group broken : const_pair (s_mode, C_THRESH);
begin
  flag <= '0';
end architecture semerr;
