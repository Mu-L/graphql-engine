module Hasura.Tracing.Reporter
  ( Reporter (..),
    noReporter,
  )
where

import Control.Monad.Trans.Control
import Hasura.Prelude
import Hasura.Tracing.Context
import Hasura.Tracing.TraceId (SpanKind)

newtype Reporter = Reporter
  { runReporter ::
      forall m a.
      (MonadIO m, MonadBaseControl IO m) =>
      -- \| Current trace context, providing the trace id and span info.
      TraceContext ->
      -- \| Human readable name of this span.
      Text ->
      -- \| Kind of the current span.
      SpanKind ->
      -- \| IO action that retrieves the metadata associated with the
      -- current span.
      IO TraceMetadata ->
      -- \| The monadic action to report
      m a ->
      m a
  }

noReporter :: Reporter
noReporter = Reporter \_ _ _ _ -> id
