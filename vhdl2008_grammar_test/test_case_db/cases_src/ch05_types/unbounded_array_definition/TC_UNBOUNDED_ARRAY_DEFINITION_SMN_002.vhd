-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::= array ( index_subtype_definition { , index_subtype_definition } ) of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Static model negative — unbounded array used as a port
--            type without a subtype constraint. An unbounded array
--            type (with range <>) is used directly as a signal port
--            type, which requires the actual to be constrained. The
--            port declaration lacks a subtype indication to bound the
--            array, causing an elaboration error.
-- Expected Result: Triggers unconstrained port error
-- Dependencies: None
-- =============================================================
entity unbounded_array_unconstrained_port is
  port (
    dout : out integer
  );
end entity unbounded_array_unconstrained_port;

architecture rtl of unbounded_array_unconstrained_port is
  type t_unbounded_vec is array (integer range <>) of integer;
  signal s_unbound : t_unbounded_vec;  -- ERROR: unconstrained signal declaration (no index constraint)
  signal s_val : integer := 0;
begin
  s_val <= s_unbound(0);
  dout <= s_val;
end architecture rtl;
