-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SNN_005
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Negative
-- Test Focus: Reserved word used as guarded signal name in the signal list -- "all" is a reserved word for disconnection_specification and cannot appear as one of multiple explicit names in a guarded_signal_list; placing "all" as an element in the comma-separated list is syntactically invalid
-- Expected Result: Triggers syntax error (reserved word in wrong position)
-- Dependencies: None
-- =============================================================
entity gss_snn5_reserved is
  port(r : out bit bus);
end entity;

architecture bh of gss_snn5_reserved is
  signal s_a, s_b : bit bus := '0';
  -- ERROR: "all" cannot be a signal name in guarded_signal_list
  disconnect s_a, all : bit after 2 ns;
begin
  s_a <= '1'; s_b <= '1';
  r <= s_a or s_b;
end architecture bh;
