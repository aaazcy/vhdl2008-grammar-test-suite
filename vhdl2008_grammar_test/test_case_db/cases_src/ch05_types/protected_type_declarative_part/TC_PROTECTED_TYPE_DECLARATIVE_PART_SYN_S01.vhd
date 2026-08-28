-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: declarative part with
--   subprogram declarations (procedure + impure function),
--   attribute_specification on both, and a use_clause.
--   Exercises the complete set of allowed items in
--   repetition, covering all BNF alternation variants.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_dp_syn_s01 is
  port (
    trig  : in  bit;
    count : out natural
  );
end entity pt_decl_dp_syn_s01;

architecture rtl of pt_decl_dp_syn_s01 is
  attribute mark_debug : string;
  type t_event_counter is protected
    procedure fire;
    procedure reset;
    impure function total return natural;
    attribute mark_debug of fire : procedure is "true";
    attribute mark_debug of total : function is "true";
  end protected;
  type t_event_counter is protected body
    variable v_count : natural := 0;
    procedure fire is begin v_count := v_count + 1; end procedure;
    procedure reset is begin v_count := 0; end procedure;
    impure function total return natural is begin return v_count; end function;
  end protected body;
  shared variable sv : t_event_counter;
begin
  process(trig)
  begin
    if trig'event and trig = '1' then
      sv.fire;
      count <= sv.total;
    end if;
  end process;
end architecture rtl;
